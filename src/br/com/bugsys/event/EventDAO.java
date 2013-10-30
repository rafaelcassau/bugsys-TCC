package br.com.bugsys.event;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import br.com.bugsys.infra.HibernateUtil;
import br.com.bugsys.project.Project;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class EventDAO {

	private Session session;
	
	public EventDAO() {
		this.session = HibernateUtil.getSessionFactory().openSession();
	}
	
	@SuppressWarnings("unchecked")
	public List<Event> findEvent() {
		
		StringBuilder hql = new StringBuilder()
			.append("")
			.append("");
		
		Query query = this.session.createQuery(hql.toString())
				.setParameter("", "");
		
		List<Event> listEvents = (List<Event>) query.list();
		
		return listEvents;
	}
	
	public Event persistEvent(Event event) {
		
		this.session.clear();
		
		Transaction transaction = this.session.beginTransaction();
		
		Event eventReturn = null;
		
		if(event.getId() == null){
			
			Integer id = (Integer) this.session.save(event);
			
			eventReturn = this.findEventById(id);
			
		} else {
			
			this.session.update(event);
			eventReturn = event;
		}

		transaction.commit();
		
		return eventReturn;
	}
	
	public Event findEventById(Integer eventID) {
		
		StringBuilder hql = new StringBuilder()
			.append(" FROM Event e")
			.append(" WHERE e.id = :eventID");
		
		Query query = this.session.createQuery(hql.toString())
			.setParameter("eventID", eventID);
		
		Event event = (Event) query.uniqueResult();
		
		return event;
	}
}