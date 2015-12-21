class User < ActiveRecord::Base
  enum role: [:admin, :user, :supplier ] # Array[0,1,2,3 ...] gej yavna.
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

# =========================== ENUM tailbar ===========================-

# Declare an enum attribute where the values map to integers in the database, but can be queried by name. Example:

# class Conversation < ActiveRecord::Base
#   enum status: [ :active, :archived ]
# end

# # conversation.update! status: 0
# conversation.active!
# conversation.active? # => true
# conversation.status  # => "active"

# # conversation.update! status: 1
# conversation.archived!
# conversation.archived? # => true
# conversation.status    # => "archived"

# # conversation.status = 1
# conversation.status = "archived"

# conversation.status = nil
# conversation.status.nil? # => true
# conversation.status      # => nil

# Scopes based on the allowed values of the enum field will be provided as well. With the above example:

# Conversation.active
# Conversation.archived

# Of course, you can also query them directly if the scopes don't fit your needs:

# Conversation.where(status: [:active, :archived])
# Conversation.where.not(status: :active)

# You can set the default value from the database declaration, like:

# create_table :conversations do |t|
#   t.column :status, :integer, default: 0
# end

# Good practice is to let the first declared status be the default.

# Finally, it's also possible to explicitly map the relation between attribute and database integer with a hash:

# class Conversation < ActiveRecord::Base
#   enum status: { active: 0, archived: 1 }
# end

# Note that when an array is used, the implicit mapping from the values to database integers is derived from the order the values appear in the array. In the example, :active is mapped to 0 as it's the first element, and :archived is mapped to 1. In general, the i-th element is mapped to i-1 in the database.

# Therefore, once a value is added to the enum array, its position in the array must be maintained, and new values should only be added to the end of the array. To remove unused values, the explicit hash syntax should be used.

# In rare circumstances you might need to access the mapping directly. The mappings are exposed through a class method with the pluralized attribute name, which return the mapping in a HashWithIndifferentAccess:

# Conversation.statuses[:active]    # => 0
# Conversation.statuses["archived"] # => 1

# Use that class method when you need to know the ordinal value of an enum. For example, you can use that when manually building SQL strings:

# Conversation.where("status <> ?", Conversation.statuses[:archived])

# You can use the :_prefix or :_suffix options when you need to define multiple enums with same values. If the passed value is true, the methods are prefixed/suffixed with the name of the enum. It is also possible to supply a custom value:

# class Conversation < ActiveRecord::Base
#   enum status: [:active, :archived], _suffix: true
#   enum comments_status: [:active, :inactive], _prefix: :comments
# end

# With the above example, the bang and predicate methods along with the associated scopes are now prefixed and/or suffixed accordingly:

# conversation.active_status!
# conversation.archived_status? # => false

# conversation.comments_inactive!
# conversation.comments_active? # => false


