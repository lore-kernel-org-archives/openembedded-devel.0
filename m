Received: from mail-la0-f45.google.com ([209.85.215.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1U8XFi-0005ed-AU
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Feb 2013 15:36:26 +0100
Received: by mail-la0-f45.google.com with SMTP id er20so8936837lab.32
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2013 06:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=ug3fycXXnixjvGpz37xcXSKNWT2yW27/ps6Q3FQg8/U=;
	b=ZEpibytFkT7WFv5VlIJEOqJTVCwWTemRB0Q1/CT4tjykkPItoDO5EvLCzEPulj4uc5
	vEg1xWWyYfDcbCO5W+pUXMTL0+Y6kcJwIiqjNRym+eVKFWdBEWbNHA1kxYgmfLiyeOLM
	h6f5JCUVKW4KqLR62Qjn1JxoFHi0gzQ4gQ6+XyX3pBM93hO4NilKshRhz6ruS9rt8NxN
	vkQOVez3ftPt5djmCocoRgBAE1uu8pMi+tHnBxP4Mo/GUjv0WuabYibz6jnTXwmb+X0O
	uryLzpZIviHRd+wrjA6D7S7Z2szgA8IQ7TK+WBTcy4G17OSRnpQ8ZGg9uaL3shcgsy6/
	FYwg==
X-Received: by 10.112.40.167 with SMTP id y7mr10443671lbk.12.1361456389803;
	Thu, 21 Feb 2013 06:19:49 -0800 (PST)
Received: from [192.168.0.96] ([84.49.231.147])
	by mx.google.com with ESMTPS id pk1sm41019002lab.0.2013.02.21.06.19.46
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 21 Feb 2013 06:19:48 -0800 (PST)
Message-ID: <51262D01.7070601@gmail.com>
Date: Thu, 21 Feb 2013 15:19:45 +0100
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Qt5
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
X-List-Received-Date: Thu, 21 Feb 2013 14:36:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Is the meta-qt5 layer at https://github.com/meta-qt5 a work in progress,
or should it be usable in its current state?

I currently use qt4-embedded and compile and sdk with qt-support, and
want to try out qt5. Compiling qtbase gave me some packages I can add to
my image, but when I tried to create an SDK I got stuck. The
files/recipes in meta-qt5 differ so much from todays qt4-stuff that I'm
not sure where to begin, but I suspect at least an SDK-recipe/task and
maybe some qt5-embedded recipes will have to be added?

Thought maybe I'd see if I can create these recipes, but I just wanted
to check if that is the plan forward.

- Tasslehoff


