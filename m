Received: from smtpauth16.prod.mesa1.secureserver.net ([64.202.165.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1PVQiW-00077u-F8
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 16:35:05 +0100
Received: (qmail 10582 invoked from network); 22 Dec 2010 15:17:54 -0000
Received: from unknown (76.192.35.208)
	by smtpauth16.prod.mesa1.secureserver.net (64.202.165.22) with ESMTP;
	22 Dec 2010 15:17:54 -0000
Message-ID: <4D121905.3060205@mwester.net>
Date: Wed, 22 Dec 2010 09:28:05 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20101221220041.GD19986@denix.org> <iescrt$keo$2@dough.gmane.org>
In-Reply-To: <iescrt$keo$2@dough.gmane.org>
Subject: Re: base.bbclass changes broke BitBake 1.8.19
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
X-List-Received-Date: Wed, 22 Dec 2010 15:35:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/22/2010 2:28 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 21-12-10 23:00, Denys Dmytriyenko wrote:
>> Chris,
>>
>> The c67b95955d023c1f198531b4f06100a40b05efa7 has introduced the following 
>> problem with BitBake 1.8.19 and even af81d52e48cb6d4f91fff0c70e09dfd421e0057d 
>> didn't fix it. Any thoughts? Thanks.
> 
> Since the release is out, can be bump to 1.10.0 as minimum bitbake now?

As one of the objectors when this was originally proposed, I think it
pertinent to note that I've (finally) managed to test SlugOS with
bitbake 1.10.1 and all's well, so +1 from me.

Thanks,
-Mike (mwester)


