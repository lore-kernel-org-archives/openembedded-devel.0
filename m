Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwhoosier@gmail.com>) id 1IIneB-0008FX-9H
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Aug 2007 17:40:31 +0200
Received: by wa-out-1112.google.com with SMTP id l24so246232waf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Aug 2007 08:37:53 -0700 (PDT)
Received: by 10.114.181.1 with SMTP id d1mr293275waf.1186587472784;
	Wed, 08 Aug 2007 08:37:52 -0700 (PDT)
Received: by 10.114.73.7 with HTTP; Wed, 8 Aug 2007 08:37:52 -0700 (PDT)
Message-ID: <d543f5920708080837o7172fc00gfdf3820f46013a3a@mail.gmail.com>
Date: Wed, 8 Aug 2007 10:37:52 -0500
From: "Matt Hoosier" <matt.hoosier@gmail.com>
Sender: mwhoosier@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d543f5920708080835g76bf1633jcb46c4337c7629c4@mail.gmail.com>
MIME-Version: 1.0
References: <d543f5920708071623g37c9844fs47db2c11d73d1ec9@mail.gmail.com>
	<1186575579.6091.43.camel@localhost.localdomain>
	<d543f5920708080620h171bb132o91d4aba695d9209@mail.gmail.com>
	<14210558366.20070808155849@vanille-media.de>
	<d543f5920708080835g76bf1633jcb46c4337c7629c4@mail.gmail.com>
X-Google-Sender-Auth: 90da52c2270f2671
Subject: Re: Inheriting conditionally
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2007 15:40:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> Hmm, http://www.openembedded.org/user-manual&dpage=special_overrides
> doesn't have anything at the moment.
>
> I also had trouble finding a good example in the existing packages
> (well, it was Poky, which contains fewer packages than full OE). Do
> you happen to know a good example?
>

Oh, wait a minute. Maybe you're just referring to stuff like:

  DEPENDS = "default set of packages"
  DEPENDS_distro = "special set of packages"


