Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NT2QP-0005Vv-ES
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jan 2010 01:10:00 +0100
Received: by fxm4 with SMTP id 4so15744241fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2010 16:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wLiEraD6E+hghB1BHubEeqP0cbbRI1I0R6EH8+HJXo0=;
	b=bxZaPTMVgAG1ulrXboTbRd1N1QAv+oWgKsjgKDb2qF6YsH4AbJgTrVPxMq5vsuKesa
	Wxzo1q+wEhAO4RQ8UN4+GdWaa6XOmZUpF1hov5Pusr+My6pz995cLN7r2IrpuQg88ZZJ
	PV5VvghBgBLhlWB+5BcDfTp7busRyBF4vu66Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=CsJELS1maK2o2oaeqriTBjyvxqL/QTIrYqynxa8zKU5MKfxlRd8sf9g7QNFngIUgtC
	afzOMD5B4hI/zeX2nVeGETnWX5D0Ykz5gw9LkfdhBoiCWbP+k0XbneHXIDl02eHlXEVV
	UZsqXELUIXZt9Cz8GEhx+4fnRQp3NbrhVZEvk=
MIME-Version: 1.0
Received: by 10.239.188.193 with SMTP id q1mr895422hbh.71.1262909271850; Thu, 
	07 Jan 2010 16:07:51 -0800 (PST)
In-Reply-To: <1262896003.2553.266.camel@lenovo.internal.reciva.com>
References: <hi5b61$f7h$1@ger.gmane.org>
	<1262892164.2553.230.camel@lenovo.internal.reciva.com>
	<c384c5ea1001071148h770db2a7p10f6a7b51582fea5@mail.gmail.com>
	<1262896003.2553.266.camel@lenovo.internal.reciva.com>
Date: Fri, 8 Jan 2010 01:07:51 +0100
Message-ID: <c384c5ea1001071607j4feb0521u44d03f682201d1b9@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Bump default version for gtk+ to 2.18.3
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
X-List-Received-Date: Fri, 08 Jan 2010 00:10:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

thanks for the valuable insights.

On Thu, Jan 7, 2010 at 9:26 PM, Phil Blundell <philb@gnu.org> wrote:
>
> untested or untrusted. =A0I would also propose that, in future, any
> setting of DEFAULT_PREFERENCE in a recipe must be accompanied by a
> comment explaining why it was set, and (if it is set negatively) under
> what conditions it can or should be removed.
>

I would propose that anything out-of-the ordinary in a recipe is accompanie=
d
with a comment.

I.e. if there is a reason outside OpenEmbedded for disabling or working aro=
und
something, please mention it in the recipe.


Regards,
--=20
Leon


