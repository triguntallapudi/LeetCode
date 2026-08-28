class Solution(object):
    def plusOne(self, digits):
        str1 = ""

        for i in digits:
            str1 = str1 + str(i)

        str1 = int(str1)
        str2 = str1 + 1

        list1 = []

        for i in str(str2):
            list1.append(int(i))

        return list1
        