class Solution:
    def check(self, nums: List[int]) -> bool:
        arr=sorted(nums)
        for _ in range(len(nums)):
            if nums==arr:
                return True
            nums = nums[1:] + [nums[0]]
        return False




                