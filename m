Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1SINiZ-00030e-T5
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2012 19:22:00 +0200
Received: (qmail 17206 invoked by uid 1003); 12 Apr 2012 17:12:38 -0000
Received: from unknown (HELO ?192.168.1.110?) (philip@opensdr.com@157.22.28.13)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	12 Apr 2012 17:12:38 -0000
Message-ID: <4F870D05.5070308@balister.org>
Date: Thu, 12 Apr 2012 10:12:37 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1334185891-25460-1-git-send-email-philip@balister.org>	<1334185891-25460-3-git-send-email-philip@balister.org>
	<jm5ue3$ggg$1@dough.gmane.org>
In-Reply-To: <jm5ue3$ggg$1@dough.gmane.org>
X-Enigmail-Version: 1.1.2
Subject: Re: [meta-oe 2/5] python-cheetah : Remove DEPENDS on python native packages.
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
X-List-Received-Date: Thu, 12 Apr 2012 17:22:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/11/2012 11:58 PM, Koen Kooi wrote:
> Op 12-04-12 01:11, philip@balister.org schreef:
>> From: Philip Balister <philip@opensdr.com>
> 
>> The oe-core recipe no longer explicitly provides various -native 
>> packages. THe recipe builds fine without them.
> 
> These are _R_DEPENDS, have you verified that it runs without them?

The -native versions are only needed at build time.

I do not have an easy way to runtime test the build quite yet, but I
would like to get the recipes in meta-oe building something that is more
useful than the existing recipes. I can handle small fixes in updates.

Philip


