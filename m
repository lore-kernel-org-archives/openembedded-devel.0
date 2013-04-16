Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1US8A2-0008HN-JI
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 17:51:11 +0200
Message-ID: <516D6F54.1070208@communistcode.co.uk>
Date: Tue, 16 Apr 2013 16:33:40 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1366116169-19800-1-git-send-email-marcin.juszkiewicz@linaro.org>
In-Reply-To: <1366116169-19800-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: Re: [meta-oe][PATCH] php: update to 5.4.14
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
X-List-Received-Date: Tue, 16 Apr 2013 15:51:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/13 13:42, Marcin Juszkiewicz wrote:
> Build tested for AArch64 and x86.
> Runtime tested on x86.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   meta-oe/recipes-devtools/php/php.inc               |  4 +-
>   .../recipes-devtools/php/php/phar-makefile.patch   |  8 +--
>   .../recipes-devtools/php/php/php-m4-divert.patch   | 83 ----------------------
>   .../recipes-devtools/php/php/php_exec_native.patch | 26 ++++---
>   .../php/{php_5.3.19.bb => php_5.4.14.bb}           |  5 +-
>   5 files changed, 26 insertions(+), 100 deletions(-)
>   delete mode 100644 meta-oe/recipes-devtools/php/php/php-m4-divert.patch
>   rename meta-oe/recipes-devtools/php/{php_5.3.19.bb => php_5.4.14.bb} (75%)
>
> [snip]

Runtime tested arm7va, thanks Marcin!

Cheers,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



