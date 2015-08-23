package edu.scnu316.service;

import java.util.List;

import edu.scnu316.entity.User;

/**
 * @author 小叶浪浪浪
 * 批量生成用户Service接口
 */

/**
 * @param user_account
 * 用户生成规则：
 * 用户账号=前缀+序号
 * user_account=prefix+order
 * 前缀为5到8位大小写字母或数字
 * 序号为0到9999的整数，保存时不满4位系统自动填充为4位
 * 如 scnu20120010 由 scnu2012 和    0010  组成
 * user_account的正则表达式符合:  [a-z,A-Z,0-9]{5-8}[0-9]{4}
 */

public interface UserService {

	/**
	 * 检查由规则生成的用户账号是否可以被创建<p>
	 * Example:
	 * <blockquote><pre>
	 * check("scnu123",0,10);<br>
	 * 检查  "scnu1230000"  到  "scnu1230009"  之间的账号是否可被创建
	 * </pre></blockquote>
	 * @param prefix 用户账号前缀
	 * @param first 开始序号
	 * @param number 生成数量
	 * @return true 没有重复，账号可用被创建<br>
	 * 		   false 出现重复，账号不可被创建
	 */
	public boolean check(String prefix, int first, int number);
		
	/**
	 * 按照规则，批量生成用户账号<p>
	 * Example:
	 * <blockquote><pre>
	 * createUser("scnu012",1000,20);
	 * 生成  "scnu0121000" 到  "scnu0121019" 之间的账号
	 * </pre></blockquote>
	 * @param prefix 用户账号前缀
	 * @param first 开始序号
	 * @param number 生成数量
	 * @param model 用户生成模板，
	 * 需保证模板含有：1.默认密码；2.租期；3.批量指定租期内的费用（元）；
	 * @return true 创建成功<br>
	 * 		   false 创建失败
	 */
	public boolean createUser(String prefix, int first, int number, User model);
	
	/**
	 * 生成单个实验用户
	 * @param model 实验用户模板
	 * @return true 创建成功 false 创建失败
	 */
	public boolean createUser(User model);
		
	/**
	 * 根据筛选条件返回符合条件的用户<br>
	 * 返回用户符合以下条件：（当模板属性不为空时）
	 * <blockquote><pre>
	 * 1、用户账号以模板账号为开头；<br>
	 * 2、用户单位与模板单位相同；<br>
	 * 3、用户锁定状态与模板锁定状态相同；<br>
	 * </pre></blockquote>
	 * @param model	用户模板
	 * @return 符合条件的用户列表
	 */
	public List<User> userFilter(User model);
	
	/**
	 * 根据用户ID，删除指定用户
	 * @param user_id 用户ID
	 * @return true 删除成功<br>
	 * 		   false 删除失败
	 */
	public boolean deleteUser(int user_id);
	
	/**根据用户ID返回用户
	 * @param user_id
	 * @return 该ID的用户
	 */
	public User getUserByID(int user_id);
	/**
	 * 根据用户账号返回一个用户
	 * @param user_id
	 * @return 
	 */
	public User getUser(String user_account);
	
	/**
	 * 实验用户登录验证
	 * @param userName
	 * @param password
	 * @return 返回验证结果:
	 * User_NotFound(找不到用户)
	 * Login_success(登录成功)
	 * Login_fall(密码错误，登录失败)
	 */
	public abstract String CheckLogin(String user_account,String password);
	
	
	/**
	 * 实验用户更新
	 * @param user 要更新的实验用户
	 * @return true 更新成功 false 更新失败
	 */
	public boolean updateUser(User user);
	
}
