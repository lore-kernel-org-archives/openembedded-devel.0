Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <wohauser@gmx.de>) id 1Pa6Vj-0003Pg-66
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 14:01:11 +0100
Received: (qmail invoked by alias); 04 Jan 2011 12:54:07 -0000
Received: from p549CCA5E.dip.t-dialin.net (EHLO [192.168.3.102])
	[84.156.202.94]
	by mail.gmx.net (mp064) with SMTP; 04 Jan 2011 13:54:07 +0100
X-Authenticated: #656260
X-Provags-ID: V01U2FsdGVkX1/4xNBjWvL4ZJIP129J+mgtD6RPdZNz0QtpeBvNku
	G2PM5OxFR8A91b
Message-ID: <4D23186C.8080803@gmx.de>
Date: Tue, 04 Jan 2011 13:54:04 +0100
From: Wolfgang Hauser <wohauser@gmx.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; de-AT;
	rv:1.9.1.16) Gecko/20101123 SeaMonkey/2.0.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>	<1294084926-3115-9-git-send-email-rep.dot.nop@gmail.com>	<201101032354.25037.roman@khimov.ru>
	<4D230B5A.3030202@gmx.de>
	<AANLkTikAsHGf9H2YUVt6c7eqauOHyWuNUGC9Oy92TOBV@mail.gmail.com>
In-Reply-To: <AANLkTikAsHGf9H2YUVt6c7eqauOHyWuNUGC9Oy92TOBV@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH 09/12] busybox: provide postrm for package mdev
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
X-List-Received-Date: Tue, 04 Jan 2011 13:01:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

I agree for the test statement, but that may be solved by using ´the
brackets in the long statement.

Otavio Salvador schrieb:
> On Tue, Jan 4, 2011 at 09:58, Wolfgang Hauser <wohauser@gmx.de> wrote:
>> Keep it simple and stupid!
>> So I vote for the long, readable and less error prone version.
> 
> I usually prefer the KISS however on this specific case I disagree.
> 
> The new code avoid using test and a fork. This allows for "test"
> applet removal if desired.
> 
> I prefer the ugly but more "embedded like" code.
> 


