Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R5eXV-0007Tu-1p for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 16:09:41 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R5eSO-0007nM-VN for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 16:04:24 +0200
Received: from nat-rup.mentorg.com ([139.181.168.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2011 16:04:24 +0200
Received: from dbaryshkov by nat-rup.mentorg.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2011 16:04:24 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Mon, 19 Sep 2011 18:03:32 +0400
Message-ID: <j57i4p$i51$1@dough.gmane.org>
References: <1316384018-7651-1-git-send-email-dbaryshkov@gmail.com>
	<j56n5t$s0d$2@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: nat-rup.mentorg.com
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.20) Gecko/20110820 Icedove/3.1.12
In-Reply-To: <j56n5t$s0d$2@dough.gmane.org>
Subject: Re: [meta-oe][V3] openssl: fixup the openssl-fix-link patch
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
X-List-Received-Date: Mon, 19 Sep 2011 14:09:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/19/2011 10:23 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 19-09-11 00:13, Dmitry Eremin-Solenikov schreef:
>> Include more dependencies into openssl-fix-link.patch patch.
>>
>> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>  ---
>> .../openssl/openssl-1.0.0e/openssl-fix-link.patch  |   22
>> +++++++++++-------- .../recipes-connectivity/openssl/openssl_1.0.0e.bb |
>> 2 +- 2 files changed, 14 insertions(+), 10 deletions(-)
>
>
> I still get: NOTE: package openssl-native-1.0.0e-r13.1: task do_patch: Failed

Strange. Please check:
md5sum 
sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch 

03c99586e59ea5a25e0598c7419d8aff 
sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch

-- 
With best wishes
Dmitry



