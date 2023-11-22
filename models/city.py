#!/usr/bin/python3
""" City Module for HBNB project """
from models.base_model import BaseModel, Base, ForeignKey, State
from sqlalchemy import Column, String
from sqlalchemy.orm import relationship
from sqlalchemy.orm import backref

class City(BaseModel,Base):
    """ The city class, contains state ID and name """

    __tablename__= 'cities'
    name = Column(String(128), nullable=False)
    state_id = Column(String(60), ForeignKey("state.id"), nullable=False)
    state = relationship(State, backref=backref("cities", cascade="all,delete"))