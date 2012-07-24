from datetime import datetime
from sqlalchemy import Column, DateTime, Integer, Text, Boolean
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import scoped_session, sessionmaker

DBSession = scoped_session(sessionmaker())
Base = declarative_base()

class Application(Base):
    __tablename__ = 'applications'
    id = Column(Integer, primary_key=True)
    realname = Column(Text)
    username = Column(Text, unique=True)
    country = Column(Text)
    state = Column(Text)
    hardware = Column(Text)
    shield = Column(Text)
    date = Column(DateTime, default=datetime.now)
    text = Column(Text)
    approved = Column(Boolean, default=False)
    address = Column(Text)

    def __repr__(self):
        return "<Application %s %s>" % (self.username, self.hardware)
