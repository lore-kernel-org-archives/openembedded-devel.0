Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PJsXq-0003oD-IV
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Nov 2010 19:52:19 +0100
Received: by iwn38 with SMTP id 38so1317806iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Nov 2010 10:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=NjsZsEQWItvxrbZXbXjBnQP+Lmm9HbJvyJQdtr5efQU=;
	b=lCirGKQRBF0R+WmxmH4ROurUybpUHcJIxumA5y+cKOqqeamtEkTbSj7cJa6vvndC3S
	XIGCc+9GEgBhGN4pj2Wryu3ncXAA+bnLTLX8hpH4GPFTLXIYnhzqvczD2Q68xNF+tQYV
	A+0vf50t9HehJQRIxBXZTxorFk4P5ja7A1LRU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=u5SVC6EEd/Y6r/Vb4d9LCPTMASSMJf1U7krr9j9Se0g2QyGNnFR3jQI+YRd9yg6dmg
	3d6qHWHqEcyuESXoFYB5HbCiimjNykz3oliaJAhmhROwa8pTTQiwVNA1O7GLrTzVQXP4
	IqYv0TU70F3AFS9jqMuXu89CsWq3yLyXbLF9g=
MIME-Version: 1.0
Received: by 10.231.37.197 with SMTP id y5mr3986684ibd.151.1290279068305; Sat,
	20 Nov 2010 10:51:08 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Sat, 20 Nov 2010 10:51:08 -0800 (PST)
Date: Sat, 20 Nov 2010 19:51:08 +0100
Message-ID: <AANLkTinsyLsC1DqEbaOQscF-GZJFiLBsL8uFouyPEzg2@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: handhelds.org
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
X-List-Received-Date: Sat, 20 Nov 2010 18:52:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

HI,

Today Jay mentioned on irc that handhelds.org is down permanently.
We have at least 36 recipes that fetch from it.
What are we doing with these?

One of the recipes that became unbuildable is update-rc.d which is in
the dependency list of a lot of recipes ....

Frans.


