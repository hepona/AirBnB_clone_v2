#!/usr/bin/python3
""" State Module for HBNB project """
from models.city import City
from models.base_model import BaseModel
from models.base_model import BaseModel, Base
from sqlalchemy import Column, String
from sqlalchemy.orm import relationship
import os


class State(BaseModel, Base):
    """State class"""

    __tablename__ = "states"
    cities = relationship("City", cascade="all,delete", backref="state")
    name = Column(String(128), nullable=False, unique=True)

    if os.getenv("HBNB_TYPE_STORAGE") != "db":

        @property
        def cities(self):
            from models import storage

            """return the list of City objects from storage"""
            lst = []
            listcity = storage.all(City)
            for c in listcity.values():
                lst.append(c)
            print(f"test lst:", lst)
            return lst
