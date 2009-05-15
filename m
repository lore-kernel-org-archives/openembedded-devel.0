Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M55Tt-0007RP-FX
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 May 2009 00:02:19 +0200
Received: from 88-109-251-122.dynamic.dsl.as9105.com ([88.109.251.122]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M55Mt-0005IH-TH
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 22:55:06 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A0DBCAC.5000403@balister.org>
References: <f96d234e0904300544g4f933c15x1abaa430373868fa@mail.gmail.com>
	<1241101618.30742.241.camel@mill.internal.reciva.com>
	<f96d234e0904301843q27803491xe14c09bf75193fe7@mail.gmail.com>
	<1241695142.16805.170.camel@mill.internal.reciva.com>
	<4A02CF2A.70804@balister.org>
	<1242410201.4514.79.camel@lenovo.internal.reciva.com>
	<4A0DBCAC.5000403@balister.org>
Date: Fri, 15 May 2009 22:54:44 +0100
Message-Id: <1242424484.4514.117.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: progress on OE organization issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 May 2009 22:02:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-05-15 at 15:04 -0400, Philip Balister wrote:
> What exactly are you proposing to do?

I think I've outlined in previous mails what I see as the most pressing
problem with the status quo: basically, lack of direction and
leadership.  

The easiest and quickest way to fix that seems to simply be to have some
kind of steering group be directly elected by the developers and given a
suitable mandate to make decisions (both big and small) and carry out
general project oversight.

Unlike with the e.V. board there would be no regulatory, legal, or
(directly) fiscal responsibilities attached to these positions, which
should make them somewhat easier to fill since the pool of candidates
would be bigger.  About five members is probably the right size for this
committee: you want it to be an odd number ideally, and certainly no
less than 3 or more than 7.  I would also suggest that the appointment
be for a relatively short period, maybe 3 or 6 months, to try to limit
any problems caused by people "drifting off" because their interest in
OE has taken a back seat to other commitments.  The steering group would
be operated in as open a fashion as possible, with at least its
decisions and a brief rationale (if not details of its full
deliberations) being published.

Absent any more formal membership criteria, the easiest way to define
the pool of "members" seems to be to do what Cliff did with his recent
poll about moving the servers: to take the list of keys with write
access to the git repository, and grant one vote to each developer.  (In
this case we would probably want to use some kind of STV scheme since we
are looking for multiple winners rather than a simple yes/no answer.)

p.



