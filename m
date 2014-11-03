Return-Path: <maciej.borzecki@open-rnd.pl>
X-Greylist: delayed 491 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 03 Nov 2014 07:38:49 UTC
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 8B3B4706B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Nov 2014 07:38:49 +0000 (UTC)
Received: from comp-006-thk (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id DC1F237F5BE;
	Mon,  3 Nov 2014 08:30:33 +0100 (CET)
Message-ID: <1414999833.3910.1.camel@open-rnd.pl>
From: Maciek Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-devel@lists.openembedded.org, Yevhen Kyriukha
	<kirgene@gmail.com>
Date: Mon, 03 Nov 2014 08:30:33 +0100
In-Reply-To: <1414844456-20731-1-git-send-email-kirgene@gmail.com>
References: <1414844456-20731-1-git-send-email-kirgene@gmail.com>
Organization: Open-RnD sp. z o.o.
X-Mailer: Evolution 3.12.5 (3.12.5-1.fc20) 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH] rabbitmq-c: update to v0.5.2.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Nov 2014 07:38:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On sob, 2014-11-01 at 14:20 +0200, Yevhen Kyriukha wrote:
> Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
> ---
>  .../rabbitmq-c/{rabbitmq-c_0.5.0.bb => rabbitmq-c_0.5.2.bb}           | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-connectivity/rabbitmq-c/{rabbitmq-c_0.5.0.bb => rabbitmq-c_0.5.2.bb} (78%)
> 
> diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.2.bb
> similarity index 78%
> rename from meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb
> rename to meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.2.bb
> index 91acb1d..762ecd6 100644
> --- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb
> +++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.2.bb
> @@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=6b7424f9db80cfb11fdd5c980b583f53"
>  LICENSE = "MIT"
>  
>  SRC_URI = "https://github.com/alanxz/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
> -SRC_URI[md5sum] = "b1f902c658c772cda464754678d8deb6"
> -SRC_URI[sha256sum] = "53702ea2ab809af0f923e387458e2cad191d9549f50410035fe82ce5e6ccc4fa"
> +SRC_URI[md5sum] = "aa8d4d0b949f508c0da25a9c20bd7da7"
> +SRC_URI[sha256sum] = "1ec3c1141593b91c57bf1051657a1d64fb87da38760c7128a9622b107990f2f2"
>  
>  DEPENDS = "popt openssl"
>  
Tested on top of 350139ba63fc1cf84d04c482a5407dfa8b724f63.

Acked-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>


-- 
Maciej Borzęcki
Senior Software Developer at Open-RnD Sp. z o.o., Poland
www.open-rnd.pl
mobile: +48 889 117 365, fax: +48 42 657 9079

Niniejsza wiadomość wraz z załącznikami może zawierać chronione prawem
lub poufne informacje i została wysłana wyłącznie do wiadomości i
użytku osób, do których została zaadresowana. Jeśli wiadomość została
otrzymana przypadkowo zabrania się jej kopiowania lub rozsyłania do
osób trzecich. W takim przypadku uprasza się o natychmiastowe
zniszczenie wiadomości oraz poinformowanie nadawcy o zaistniałej
sytuacji za pomocą wiadomości zwrotnej. Dziękujemy.

This message, including any attachments hereto, may contain privileged
or confidential information and is sent solely for the attention and
use of the intended addressee(s). If you are not an intended addressee,
you may neither use this message nor copy or deliver it to anyone. In
such case, you should immediately destroy this message and kindly notify
the sender by reply email. Thank you.



