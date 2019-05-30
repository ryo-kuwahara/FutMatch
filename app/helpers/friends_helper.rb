module FriendsHelper
    def exist_friend(follower, followed)
        if Friend.find_by('follower_id = ? and followed_id = ?', follower, followed)
            return true
        else
            return false
        end
    end
end
