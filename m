Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1Rb2I8-0006kq-QY
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 04:47:33 +0100
Received: by qcqw6 with SMTP id w6so917840qcq.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2011 19:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Yde6TJtfnb6KKnx4HTl3dL0tYYeBa6KkKxYpxsvCUxE=;
	b=gP6U9RS3DpSmp9mZvomsjV5lguqWxBFaRE+52XuscJsNnErNwC9vuPyaKcrTkOmJkA
	QVpDQXtmaClxAiP+N/W/VlSWynRdGh9lD0vaoo5Ygsp9Rqy685y5vUiTt5cjBFai/1Rm
	FmsdrmmhtzSJCYmAo/FE35j6BGnNZsXXmK/fo=
MIME-Version: 1.0
Received: by 10.224.173.135 with SMTP id p7mr2305670qaz.83.1323920434818; Wed,
	14 Dec 2011 19:40:34 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Wed, 14 Dec 2011 19:40:34 -0800 (PST)
In-Reply-To: <20111214122225.21c780a1@robert-linuxworkstation.nanometrics.ca>
References: <20111214122225.21c780a1@robert-linuxworkstation.nanometrics.ca>
Date: Wed, 14 Dec 2011 20:40:34 -0700
Message-ID: <CA+M6bX=8Z8iWZYUp_5fWeNimddAcK8S-RwkqEFV8HzssuFbA8A@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Maintenance branch 2011-03
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
X-List-Received-Date: Thu, 15 Dec 2011 03:47:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 14, 2011 at 10:22 AM, Robert Casanova
<robertcasanova@nanometrics.ca> wrote:
> Hello Tom,
>
> we have developed a few recipes for OpenEmbedded on top of the
> 2011-03-maintenance branch the architecture used is ARM. We would like
> to send these recipes but not sure what is the maintenance policy for
> that branch or what should be the right mailing list to post to.

I hope that http://www.openembedded.org/index.php/2011.03-maintenance
answers your questions but in short, the first step is to get the
recipes into meta-oe or another layer that's based on oe-core and then
port them over to 2011.03-maintenance (it might just be a matter of
copying your old recipes but there might be feedback to incorporate
first).  Thanks and let me know if you have any questions.  This is
the correct mailing list.

-- 
Tom


