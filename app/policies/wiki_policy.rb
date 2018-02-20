class WikiPolicy < ApplicationPolicy
    def index?
      true
    end
   
    def create?
      user.present?
    end
   
    def update?
      return true if user.present? && user == wiki.user || user.admin?
    end
   
    def destroy?
      return true if user.present? && user == wiki.user || user.admin?
    end
   
    private
   
      def wiki
        record
      end
  end