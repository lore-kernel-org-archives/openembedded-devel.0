Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Q53pV-00030U-Va
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 00:25:34 +0200
Received: (qmail 8039 invoked by uid 1003); 30 Mar 2011 22:16:52 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@96.240.183.40)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	30 Mar 2011 22:16:52 -0000
Message-ID: <4D93ABD3.1020707@balister.org>
Date: Wed, 30 Mar 2011 18:16:51 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Python optimization
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
X-List-Received-Date: Wed, 30 Mar 2011 22:25:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Looks like we build python with the default setting of Optimize. 
According to the patch we can opt-out of optimizing, any idea how to do 
that?

I have some python that uses assert and docutils and they are not 
running with python built this way? Is it really worth building python 
this way?

Philip


