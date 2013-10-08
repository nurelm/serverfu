module ControllerUtil
  # Take elements in the params hash that have keys ending in _postfix and put
  # them into a new hash. For example, postfix = "page" and
  # params looks like this:
  # 
  # params = {clients_page: 'page1', other_page: 'page2', junk: 'irrelevant'}
  # 
  # Then we'll build and return this:
  # 
  # new_hash = {clients: 'page1', other: 'page2'}
  # 
  def self.extract_hash(params, postfix)
    new_hash = {}

    params.each do |key, value|
      key.match "(.*)_#{postfix}" do |new_key|
        new_hash[new_key] = value
      end
    end

    new_hash
  end
end