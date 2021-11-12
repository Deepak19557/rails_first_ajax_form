class Post < ApplicationRecord
    before_save :before_save_method_1
    before_save :before_save_method_2
  
    around_save :around_save_method_1
    around_save :around_save_method_2
  
    after_save :after_save_method_1
    after_save :after_save_method_2                             
    
    private
  
      def before_save_method_1; puts __method__; end
      def before_save_method_2; puts __method__; end
  
      def around_save_method_1
        puts __method__.to_s + " IN"
        yield
        puts __method__.to_s + " OUT"
      end 
  
      def around_save_method_2
        puts __method__.to_s + " IN"
        yield
        puts __method__.to_s + " OUT"
      end 
  
      def after_save_method_1; puts __method__; end
      def after_save_method_2; puts __method__; end
  end