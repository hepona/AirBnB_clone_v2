#!/usr/bin/python3
""" State Module for HBNB project """
from models.base_model import BaseModel
from models.base_model import BaseModel, Base
from sqlalchemy import Column, String
from sqlalchemy.orm import relationship
import os
import models


class State(BaseModel, Base):
    """State class"""

    __tablename__ = "states"
    if os.getenv("HBNB_TYPE_STORAGE") == "db":
        name = Column(String(128), nullable=False, unique=True)
        cities = relationship("City", cascade="all,delete", backref="state")

    else:

        @property
        def cities(self):
            """return the list of City objects from storage"""
            lst = []
            for c in models.storage.all(City):
                lst.append(c)
            return lst
