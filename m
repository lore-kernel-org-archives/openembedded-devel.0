Received: from smtpauth04.prod.mesa1.secureserver.net ([64.202.165.95])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1Q4DmG-0005Tz-4L
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Mar 2011 16:50:44 +0200
Received: (qmail 26566 invoked from network); 28 Mar 2011 14:42:06 -0000
Received: from unknown (209.242.7.185)
	by smtpauth04.prod.mesa1.secureserver.net (64.202.165.95) with ESMTP;
	28 Mar 2011 14:42:06 -0000
Message-ID: <4D909E41.60705@mwester.net>
Date: Mon, 28 Mar 2011 09:42:09 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1301317955-22559-1-git-send-email-ospite@studenti.unina.it>
	<1301317955-22559-2-git-send-email-ospite@studenti.unina.it>
In-Reply-To: <1301317955-22559-2-git-send-email-ospite@studenti.unina.it>
Subject: Re: [PATCH 1/2] tzdata: Updated to 2011d
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
X-List-Received-Date: Mon, 28 Mar 2011 14:50:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 3/28/2011 8:12 AM, Antonio Ospite wrote:
> Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>

Acked-by: Mike Westerhof <mike@mwester.net>

> ---
>  .../tzdata/{tzdata_2011b.bb => tzdata_2011d.bb}    |    5 ++---
>  1 files changed, 2 insertions(+), 3 deletions(-)
>  rename recipes/tzdata/{tzdata_2011b.bb => tzdata_2011d.bb} (64%)
> 
> diff --git a/recipes/tzdata/tzdata_2011b.bb b/recipes/tzdata/tzdata_2011d.bb
> similarity index 64%
> rename from recipes/tzdata/tzdata_2011b.bb
> rename to recipes/tzdata/tzdata_2011d.bb
> index 158f4ce..ca225bf 100644
> --- a/recipes/tzdata/tzdata_2011b.bb
> +++ b/recipes/tzdata/tzdata_2011d.bb
> @@ -6,6 +6,5 @@ require tzdata.inc
>  
>  PR = "${INC_PR}.0"
>  
> -SRC_URI[md5sum] = "9eaf3ca354c42a32bd28e623539bf0e0"
> -SRC_URI[sha256sum] = "ff45f5ddc2ec925249626d00d7bc2ffff587e0956a1d8245517a023bf27e4cc9"
> -
> +SRC_URI[md5sum] = "03c5793502b7c41985edd73146bf7e36"
> +SRC_URI[sha256sum] = "415a54774094e8dcdc9ba141fafbee4b3b2f2140a5b8cf012eea4b37fb9a23bd"



