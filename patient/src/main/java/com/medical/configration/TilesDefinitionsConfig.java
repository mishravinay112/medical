package com.medical.configration;

import java.util.HashMap;
import java.util.Map;

import org.apache.tiles.Attribute;
import org.apache.tiles.Definition;
import org.apache.tiles.definition.DefinitionsFactory;

import com.medical.util.TilesConstant;
public final class TilesDefinitionsConfig implements DefinitionsFactory {
	
	private static final Map<String, Definition> tilesDefinitions = new HashMap<String, Definition>();
	private static final Attribute BASE_TEMPLATE = new Attribute(TilesConstant.DEFAULT_LAYOUT);
	private static final Attribute SINGLE_TEMPLATE=new Attribute(TilesConstant.SINGLE_LAYOUT);

	public Definition getDefinition(String name,org.apache.tiles.request.Request tilesContext)
	{
		return tilesDefinitions.get(name);
	}

	/**
	 * @param name
	 *            <code>Name of the view</code>
	 * 
	 * @param title
	 *            <code>Page title</code>
	 * @param body
	 *            <code>Body JSP file path</code>
	 * 
	 *            <code>Adds default layout definitions</code>
	 */
	private static void addDefaultLayoutDef(String name, String body, String header, String footer)
	{
		Map<String, Attribute> attributes = new HashMap<String, Attribute>();

		attributes.put("title", new Attribute(TilesConstant.TITLE));
		attributes.put("header", new Attribute(header));
		attributes.put("body", new Attribute(body));
		attributes.put("footer", new Attribute(footer));
		tilesDefinitions.put(name, new Definition(name, BASE_TEMPLATE, attributes));
		
	}

	private static void addSinglePageLayoutDef(String name,String body)
	{
		Map<String, Attribute> attributes=new HashMap<String,Attribute>();
		
		attributes.put("title", new Attribute("Medical Card"));
		attributes.put("body", new Attribute(body));
		
		tilesDefinitions.put(name, new Definition(name, SINGLE_TEMPLATE, attributes));
	}
	
	public static void addDefinitions()
	{

		addDefaultLayoutDef("dashboard", TilesConstant.DASHBOARD, TilesConstant.HEADER, TilesConstant.FOOTER);
		addSinglePageLayoutDef("login", TilesConstant.LOGIN_PAGE);
		addSinglePageLayoutDef("confirmation", TilesConstant.CONFIRMATION_PAGE);
		addSinglePageLayoutDef("resetPassword", TilesConstant.RESET_PASSWORD);
		
		
	}
}

