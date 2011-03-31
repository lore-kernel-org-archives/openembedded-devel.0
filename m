Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Q5FV4-0002Cm-DF
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 12:53:14 +0200
Received: by iye7 with SMTP id 7so2458262iye.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 03:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=yPEpD0xl7kot9O90CbpSWdWU4oBVmmpHbXi+hEu4PhQ=;
	b=NrKjM5TaXVMW4cbum489uES7zGOzJEDBtcK0onl99KbsEb5+5BncF05vCurf0PfJEp
	W3l1ssV1DpReXNcjWCtGEdVZzYY3PSdE4xXhAlGEy8jcMipe5ihE82GjYPggMYbGPlc+
	UMA6MrZy9fQ8giy2k7beMmI5aTd7Uem5FA0UI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=XjMB8fgeYYy2M5RW1EgMqZtkU5H1swPdvZeAebm1k7KGxApnVyK3vsxAZaQs9TPYt5
	jeWxKZVAkZZUIcSDt9634jkiQsmxrR9SguPYmyQoE/+Rz/s4cTOPGE1WENufO58kkqPL
	XNNE+s1gjHArO5WbsqQKcEdM4RQC8IAc+p2/U=
MIME-Version: 1.0
Received: by 10.43.60.65 with SMTP id wr1mr2855504icb.323.1301568670712; Thu,
	31 Mar 2011 03:51:10 -0700 (PDT)
Received: by 10.231.43.6 with HTTP; Thu, 31 Mar 2011 03:51:10 -0700 (PDT)
In-Reply-To: <in1gf0$aun$1@dough.gmane.org>
References: <20110331074506.GB23178@denix.org> <in1gf0$aun$1@dough.gmane.org>
Date: Thu, 31 Mar 2011 12:51:10 +0200
Message-ID: <AANLkTikn4r-ScRstfT_r-Adw36=682MEb_XHMKn+qs3_@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] Pull request for new TI machines, angstrom and qt4 fixes
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
X-List-Received-Date: Thu, 31 Mar 2011 10:53:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

Adding new machines on a maintenance branch seems somewhat odd as new
somewhat conflicts with maintenance.
is this what we want? And if so, what about adding new recipes?

Frans


