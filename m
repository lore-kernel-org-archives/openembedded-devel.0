Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P86uo-0007ja-4N
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 09:47:22 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 2AF1F275CE2E; Tue, 19 Oct 2010 09:46:50 +0200 (CEST)
Received: from [127.0.0.1] (gravedo.de [85.214.79.159])
	by gravedo.de (Postfix) with ESMTPSA id 965F6275CD26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 09:46:49 +0200 (CEST)
Message-ID: <4CBD4CE8.3070802@gravedo.de>
Date: Tue, 19 Oct 2010 09:46:48 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12pre) Gecko/20101011 Shredder/3.1.6pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287427884-1517-1-git-send-email-morphis@gravedo.de>	<1287427884-1517-6-git-send-email-morphis@gravedo.de>
	<20101018190026.GH3324@jama>
In-Reply-To: <20101018190026.GH3324@jama>
X-Enigmail-Version: 1.1.2
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 05/15] palmpre: prefer git version of tslib
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
X-List-Received-Date: Tue, 19 Oct 2010 07:47:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 18.10.2010 21:00, Martin Jansa wrote:
> On Mon, Oct 18, 2010 at 08:51:14PM +0200, Simon Busch wrote:
>> The git version of tslib is currently the only one which has support for the cy8mrln
>> touchscreen which is used on the palmpre device.
> 
> As stated few times (even today).. machines shouldn't decide versions,
> please patch preferred-shr-versions, I'm OK with using git version
> there.

Ok, will remove this patch and create another one which modifies
preferred-shr-versions.

regards,
morphis


