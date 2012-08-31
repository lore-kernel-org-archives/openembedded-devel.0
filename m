Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T7ZMQ-00038S-E2
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Sep 2012 00:06:42 +0200
Received: from localhost ([127.0.0.1]:51499 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T7ZAX-000455-7a
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Aug 2012 21:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:content-type
	:content-transfer-encoding; s=default; bh=2qj0IHb5w5eKpCizXOvoz+
	gSkn8=; b=mtMZBvwoGRS1+jB/QV6CX6YV3L0IuvswYntx3DK848SPjwvAGyhJ6Y
	veBwg6v3O0Y4O0fnR33wnoWRzKSErGgQ+/F864ATENW4lPo+c4mYgSNjH/nawlLv
	mSqjIi9QCtznqnpQ0jdI81Jw+qbd9uMlojdnwgcdHT5A/yGCG8SBk=
Received: from cpc2-cmbg15-2-0-cust171.5-4.cable.virginmedia.com
	([86.26.12.172]:46783 helo=[192.168.1.125])
	by eumx.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <ml@communistcode.co.uk>)
	id 1T7ZAX-000451-4t for openembedded-devel@lists.openembedded.org;
	Fri, 31 Aug 2012 21:54:25 +0000
Message-ID: <504131A2.4010004@communistcode.co.uk>
Date: Fri, 31 Aug 2012 22:50:26 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: WebOS OpenEmbedded Layers
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
X-List-Received-Date: Fri, 31 Aug 2012 22:06:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Well, it's been a long time coming and I'm sure most of you have heard 
about this already - but I thought I would drop it in for those who have 
missed the news.

https://github.com/openwebos/build-webos

I haven't had time to pick through it properly yet but hopefully there 
might be some interesting ideas we could use/upstream.

Has anyone seen anything interesting, I brefily noticed some upstart 
stuff which I remember was brought up as a possible "todo" on the list.

Cheers,



