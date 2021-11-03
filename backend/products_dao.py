from sql_connection import get_sql_connection
def get_all_products(connection):
        cursor = connection.cursor()
        query = "select product_id,name,uom_id,price_per_unit,uom.uom_name from products natural join uom;"

        cursor.execute(query) 

        response = []

        for(product_id, name, uom_id, price_per_unit,uom_name) in cursor:
            response.append({
                'product_id' : product_id,
                'name' : name,
                'uomid' : uom_id,
                'price_per_unit' : price_per_unit,
                'uom_name' : uom_name
            })

        return response


def insert_new_product(connection,product):
    cursor = connection.cursor()
    query = ("INSERT INTO products VALUES (%s,%s,%s,%s)")
    data = (product['product_id'],product['product_name'],product['uom_id'],product['price_per_unit'])
    cursor.execute(query,data)
    connection.commit()

    return cursor.lastrowid

def delete_product(connection,product_id):
    cursor = connection.cursor()    
    query = ("DELETE FROM products where product_id="+str(product_id))
    cursor.execute(query)
    connection.commit()

if __name__ == '__main__':
    connection = get_sql_connection()
    print(get_all_products(connection))
    print(insert_new_product(connection,{
        'product_id' : 10,
        'product_name': 'cabbage',
        'uom_id':2,
        'price_per_unit' :50
    }))
    print(delete_product(connection,8))