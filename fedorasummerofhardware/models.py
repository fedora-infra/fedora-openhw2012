# Copyright (C) 2012 Red Hat, Inc.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

from datetime import datetime
from sqlalchemy import Column, DateTime, Integer, Text, Boolean, Date
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
    phone = Column(Text)

    def __repr__(self):
        return "<Application %s %s>" % (self.username, self.hardware)
