Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ap.john.stirling@gmail.com>) id 1TWPAt-0007OX-VC
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Nov 2012 11:17:28 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so1055973bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Nov 2012 02:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=XSINkYG3JWFRQyO6DSFnp1Li5eK7SVA/fh6U2TtHmpA=;
	b=c/48MvJXaQDjNU0ubfjypimRfGqUjsNp0Jp2xGo95ev68PpvrCJOKlheGKY5/NUVIR
	eevt3+YbidyBy7tOqZtg5PyYjnByNXVPArkR8QS6HM7AsB2Q8E8gKpnmDYUr5HP24yXZ
	eoXwLE/gpOvHVllmi62x0+LXPJ9upBm1Tt1ClR21m6wMIrsLq8FI+HlTtEMRbC/EHXap
	iA8DUPVsEWLnRp370Q7lskIq1qZdjWVL7hWjfud/LNbwnmBsVeqetzOxAQYqI+lLa9wI
	gFJT+N7jkRxmT0pPc+7M9lW8geAaP2iGdOUpIKTpbrwZXbt/1kulZ9wmQNoZJ+7SHhsN
	60Xw==
MIME-Version: 1.0
Received: by 10.204.13.25 with SMTP id z25mr1849549bkz.119.1352369020685; Thu,
	08 Nov 2012 02:03:40 -0800 (PST)
Received: by 10.205.43.200 with HTTP; Thu, 8 Nov 2012 02:03:40 -0800 (PST)
Date: Thu, 8 Nov 2012 10:03:40 +0000
Message-ID: <CABuzA3PSXijNc_arax7faz0RAJbHW6A7yjk_BDLfqq3Oojurdg@mail.gmail.com>
From: John Stirling <ap.john.stirling@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: devshell - setting up additional environment variable
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
X-List-Received-Date: Thu, 08 Nov 2012 10:17:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

Can someone advise best way to set up additional environment variables
automatically when invoking devshell -

We used to define a do_devshell_prepend() function but that doesn't seem to
work any more.

Thanks
John

