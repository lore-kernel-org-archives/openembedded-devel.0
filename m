Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RUUm5-00039C-5Z
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Nov 2011 03:47:25 +0100
Received: by qyk30 with SMTP id 30so984223qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2011 18:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=FJ5I6QM/Xg6cT7ZgvGk4O4bGM4tpay75xn3DR5AAqNU=;
	b=oig/8IZ1bCZC7ZhNGWYSTKNMSCIME3u/8riv7kysbd9cC1HaW1oO9KoDZ/f2+EwQPl
	ivfqrRXm9xwYGyewUCux9Fze0Py4HzTRgBdc2RxVRu8ontfqP8EaHYpqz/sDSYKT4lZR
	gn+NDucWDIkk7JbEA5n+ev+g2s8t7HF0VmP4A=
MIME-Version: 1.0
Received: by 10.229.61.167 with SMTP id t39mr4369959qch.226.1322361648435;
	Sat, 26 Nov 2011 18:40:48 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Sat, 26 Nov 2011 18:40:48 -0800 (PST)
Date: Sat, 26 Nov 2011 19:40:48 -0700
Message-ID: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Documentation problems
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
X-List-Received-Date: Sun, 27 Nov 2011 02:47:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hey all,

As things stand today, the wiki is out of date and a number of folks
refuse to work on it.  Using things like "It's all text!" for firefox
only go so far and don't solve problems like people just avoiding
documentation anyhow.

Paul Menzel has mentioned that ikiwiki has been mentioned before and
that lets us have the website in a repository.  Do folks have other
ideas?

-- 
Tom


