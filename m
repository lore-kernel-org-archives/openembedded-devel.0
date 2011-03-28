Received: from smtpauth22.prod.mesa1.secureserver.net ([64.202.165.44])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1Q4Dg3-00018d-Nr
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Mar 2011 16:44:20 +0200
Received: (qmail 18916 invoked from network); 28 Mar 2011 14:42:21 -0000
Received: from unknown (75.57.154.193)
	by smtpauth22.prod.mesa1.secureserver.net (64.202.165.44) with ESMTP;
	28 Mar 2011 14:42:21 -0000
Message-ID: <4D909E50.8050309@mwester.net>
Date: Mon, 28 Mar 2011 09:42:24 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1301317955-22559-1-git-send-email-ospite@studenti.unina.it>
	<1301317955-22559-3-git-send-email-ospite@studenti.unina.it>
In-Reply-To: <1301317955-22559-3-git-send-email-ospite@studenti.unina.it>
Subject: Re: [PATCH 2/2] tzcode-native: update to 2011d
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
X-List-Received-Date: Mon, 28 Mar 2011 14:44:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 3/28/2011 8:12 AM, Antonio Ospite wrote:
> Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>

Acked-by: Mike Westerhof <mike@mwester.net>

> ---
>  ...code-native_2011b.bb => tzcode-native_2011d.bb} |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)
>  rename recipes/tzcode/{tzcode-native_2011b.bb => tzcode-native_2011d.bb} (51%)
> 
> diff --git a/recipes/tzcode/tzcode-native_2011b.bb b/recipes/tzcode/tzcode-native_2011d.bb
> similarity index 51%
> rename from recipes/tzcode/tzcode-native_2011b.bb
> rename to recipes/tzcode/tzcode-native_2011d.bb
> index 30996d9..1cc7757 100644
> --- a/recipes/tzcode/tzcode-native_2011b.bb
> +++ b/recipes/tzcode/tzcode-native_2011d.bb
> @@ -6,11 +6,11 @@ require tzcode-native.inc
>  # Also, tzdata (and it is needed to build tzcode) version can differ from
>  # tzcode version, thus this variable
>  
> -TZDATA_PV = "2011b"
> +TZDATA_PV = "2011d"
>  
>  PR = "${INC_PR}.0"
>  
> -SRC_URI[tzcode-2011b.md5sum] = "c63a1425f7252aef1fe54a258cdccff8"
> -SRC_URI[tzcode-2011b.sha256sum] = "8031d05102e5c5109521a282aaab0629680bec82db783c716905802313678d67"
> -SRC_URI[tzdata-2011b.md5sum] = "9eaf3ca354c42a32bd28e623539bf0e0"
> -SRC_URI[tzdata-2011b.sha256sum] = "ff45f5ddc2ec925249626d00d7bc2ffff587e0956a1d8245517a023bf27e4cc9"
> +SRC_URI[tzcode-2011d.md5sum] = "95095242ee368e6a7e107f154590ac11"
> +SRC_URI[tzcode-2011d.sha256sum] = "68f2c07471c5390199c09fe9fee6a22f8a4dac24713af88b92da17b33ad98cc7"
> +SRC_URI[tzdata-2011d.md5sum] = "03c5793502b7c41985edd73146bf7e36"
> +SRC_URI[tzdata-2011d.sha256sum] = "415a54774094e8dcdc9ba141fafbee4b3b2f2140a5b8cf012eea4b37fb9a23bd"



