class Solution(object):
    def addDigits(self, num):

        def sum1(num):
            total=0
            str1=str(num)
            for i in str1:
                total+=int(i)
            return total
        total=sum1(num)
        while total>9:
            total =sum1(total)
            
        return total

        