Received: from dd20204.kasserver.com ([85.13.140.93])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1PESME-0002Jg-9i
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 20:53:54 +0100
Received: from [192.168.1.128] (95-90-74-25-dynip.superkabel.de [95.90.74.25])
	by dd20204.kasserver.com (Postfix) with ESMTP id EDC951805CB58
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Nov 2010 20:53:02 +0100 (CET)
Message-ID: <4CD4608F.1060207@opensimpad.org>
Date: Fri, 05 Nov 2010 20:52:47 +0100
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CD43116.5020304@lambsys.com>	<AANLkTincNJZVqfZKkHfHRTu9R9bN+_DL_5bfHvfQXRiR@mail.gmail.com>
	<4CD45A64.7090306@lambsys.com>
In-Reply-To: <4CD45A64.7090306@lambsys.com>
X-SA-Exim-Connect-IP: 85.13.140.93
X-SA-Exim-Mail-From: Bernhard.Guillon@opensimpad.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Random problems with building locales
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
X-List-Received-Date: Fri, 05 Nov 2010 19:53:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 05.11.2010 20:26, David Lambert wrote:
> Is there a quick workaround?

You can add

ENABLE_BINARY_LOCALE_GENERATION =3D "0"

to your local.conf. It will disable locale generation.

Best regards
Bernhard



