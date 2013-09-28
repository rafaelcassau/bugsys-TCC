package br.com.bugsys.project;

import org.hibernate.Query;
import org.hibernate.Session;

import br.com.bugsys.infra.HibernateUtil;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ProjectDAO {

	private Session session;
	
	public ProjectDAO() {
		
		this.session = HibernateUtil.getSessionFactory().openSession();
	}
	
	public Project findProjectById(Integer projectID) {
		
		String hql = "FROM Project p WHERE p.id = :projectID";
		
		Query query = this.session.createQuery(hql)
				      .setParameter("projectID", projectID);
		
		Project project = (Project) query.uniqueResult();
		
		return project;
	}
}