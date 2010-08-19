Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Olxoy-000729-3y
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 07:37:49 +0200
Received: by iwn38 with SMTP id 38so1429642iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 22:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=9HhuW24Kde6J+vTUkRZ2RY9obZRUlVQe3+HHz+y5nYI=;
	b=aNnpqPqq2jqCs+6O0/3FYxwQUL453m62RgrYzivgSMBnZA4nTB5bpLCDgNmQ/kMIu8
	uuKBjGqFItDOHgW2FzxIdZuKQtXu5r2kZzvsY4hZmgVuAxioVQNwC0oxWSJQXBup9KPd
	YBDUm34xGPf78a/hAxOqaluxodgpe53ULZmmQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Fxgx0a5YwZeigaUYId0xAfaMtDH4SE3wEqYxZLKIVo1FwbUUhAigHXkwNa9f87YWCK
	eHBcbcoUJWcxeiGR5rCageaJpMa2zO/uUOIxkw6s7tPKumog/4wn76D+s4QTQxqtqWtb
	2mzccimG5CSsD8cv4b+hd6ZV4itIqGl9TPVGc=
MIME-Version: 1.0
Received: by 10.231.185.142 with SMTP id co14mr9855371ibb.97.1282196249455;
	Wed, 18 Aug 2010 22:37:29 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Wed, 18 Aug 2010 22:37:29 -0700 (PDT)
Date: Thu, 19 Aug 2010 07:37:29 +0200
Message-ID: <AANLkTiktUAR5vEATH0ZoeOLHcM0zJf4i3oCXqpyJfZnd@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: tinderbox packages
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
X-List-Received-Date: Thu, 19 Aug 2010 05:37:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

In my dir I have these bb files:
docbook-sgml-dtd/docbook-sgml-dtd-3.1-native.bb
docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb
docbook-sgml-dtd/docbook-sgml-dtd-4.4-native.bb
docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb

However tinderbox only shows the first one in the list of packages.
Does this mean the other ones are never build?
Or does something need to be done to add them to tinderbox?
Or is this a bug ?

Any wiz around who can shed a light?

Frans


