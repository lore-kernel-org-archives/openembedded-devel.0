Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QQ1Av-0003E0-AI
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 May 2011 19:50:21 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QQ17v-00016N-Ab from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 May 2011 10:47:11 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 27 May 2011 10:44:02 -0700
Received: from [172.30.80.104] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 27 May 2011 10:47:10 -0700
Message-ID: <4DDFE39C.60100@mentor.com>
Date: Fri, 27 May 2011 10:47:08 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4DDE65C5.7050605@balister.org>
In-Reply-To: <4DDE65C5.7050605@balister.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 27 May 2011 17:44:02.0625 (UTC)
	FILETIME=[AAAFBB10:01CC1C95]
Subject: Re: [2011.03-maintenance] Pull request
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
X-List-Received-Date: Fri, 27 May 2011 17:50:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/26/2011 07:37 AM, Philip Balister wrote:
> Tom,
> 
> Can you pull the following fixes from:
> 
> git://github.com/balister/openembedded.git
> branch: balister/2011.3-maintenance/pull-1
> 
> Patrik Dahlström (1):
>       firefox: add correct CFLAGS and LIBS of libIDL-2.0
> 
> Philip Balister (3):
>       libosip2 : Upgrade from version 3.1 to 3.5
>       ortp : Upgrade from version 0.13.1 to 0.16.5.
>       uhd : Upgrade from 003.000.001 to 003.001.000.
> 
> Roderick Taylor (1):
>       system-tools-backends: don't use build machine's automake-1.7
> 
> 
> These are all cherry-picks from .dev.

This has been applied, thanks!

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJN3+OXAAoJEI4NMjfc3nJxPC4IAIBEKbFe5/ey9AwLuJ2176Ly
ex1SSV/4ZG3uockIh9EqOVkuvuHsvNKf5qzjuvrLeOUGF+FEYkQu+tjKGF8402fn
PsrqMhxwN4qg7vz1BqQC4jlyRoYZtmaBmMOugm28myuC7Hc7U5NikA+7lBfQd9fm
rYfqL2oryXhAlUWM4A8t+6m7RHL7/4Bcv5+5qaWQ5WrBsImTi5FaJx8SzTdIKd81
HklaKR3RJlnAJBK1kmHMO2LEwRg2fk5HaNw9A1jKgnnywRYU4ueZ5fzaj/0rYEWW
D01oLQ0SeoTqqpMJEP8vUANUQSWg4UmI+7o9MPdba8sIU5kjO/TwcSxD1X8gh0A=
=whxV
-----END PGP SIGNATURE-----


