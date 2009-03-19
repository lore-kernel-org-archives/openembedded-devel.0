Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LkOx9-0004yp-2q
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 21:34:59 +0100
Received: by fxm20 with SMTP id 20so629437fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2009 13:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=BtgFgVqPuJfIW1glpYBoMvqa4RgmoF/twI5VsmO+CN4=;
	b=ZR38ntgQuk/PfAo9xbhSGrvpHug8AD8MC4JZiuLppx+TFyGQnvbJJOMyY01Yr6cJ+j
	watDpeuR//RK/CxBwhnPUzjOx7QS69eq/kXJ3tPiodqwcmQWnBh/n96aYxiG5jDSFJEI
	96pQCe4tDLdUIjojMY4OB33JopP76KR6qYm34=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tmNcs5PXrOEwihUCVf+JTnteDk4/antQCl3ppNlDXgqE+6DpWzZFoupvxk5MFUGBtJ
	IoXZCqBwVB0oJQkEb+ewidfuyS5PNI30TB7b5UsgIpuJu0PGClMqyCBwP3/gQkmy9MXi
	3f3F6IbHje18AOUHL8+9ndZIPyTJSwIq5PN4M=
MIME-Version: 1.0
Received: by 10.223.116.205 with SMTP id n13mr2453498faq.103.1237494838302; 
	Thu, 19 Mar 2009 13:33:58 -0700 (PDT)
In-Reply-To: <f46da1cf0903191005s75aaf40dg35693e65a3f1b73@mail.gmail.com>
References: <1237246365-32076-1-git-send-email-denis@denix.org>
	<49BEF545.4040608@dls.net> <20090317192619.GA15734@denix.org>
	<f46da1cf0903181725y177da239y9970995168a677b7@mail.gmail.com>
	<20090319020125.GA27595@denix.org> <20090319031330.GB27595@denix.org>
	<ac9c93b10903190022g15c2d59dkd814e5304cc33fb9@mail.gmail.com>
	<f46da1cf0903191005s75aaf40dg35693e65a3f1b73@mail.gmail.com>
Date: Thu, 19 Mar 2009 21:33:57 +0100
Message-ID: <ac9c93b10903191333n51f28c6wf815ab6954655805@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 0/3] rename packages/ to recipes/ per earlier agreement
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
X-List-Received-Date: Thu, 19 Mar 2009 20:34:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Apparently I had some unpushed commits on packages. I was unaware of
these and when pushing of course they created the files in packages,
I've added a commit to move those to recipes and pushed that one.
I hope this did not create a stale dir packages in the archive, or
messed up in a different way...
Anyway, apologies for any inconvenience!

Frans.


