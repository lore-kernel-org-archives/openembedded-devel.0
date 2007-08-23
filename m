Received: from [209.85.128.186] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1IOAnu-000228-RE
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Aug 2007 13:24:46 +0200
Received: by fk-out-0910.google.com with SMTP id 18so435126fks
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2007 04:23:36 -0700 (PDT)
Received: by 10.82.162.14 with SMTP id k14mr3902448bue.1187868216369;
	Thu, 23 Aug 2007 04:23:36 -0700 (PDT)
Received: by 10.82.117.9 with HTTP; Thu, 23 Aug 2007 04:23:36 -0700 (PDT)
Message-ID: <74d0deb30708230423s5646c6acqde818c35cb638613@mail.gmail.com>
Date: Thu, 23 Aug 2007 13:23:36 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: "Dr. Mickey Lauer" <mickey@vanille-media.de>
In-Reply-To: <1292598113.20070823112830@vanille-media.de>
MIME-Version: 1.0
References: <74d0deb30708230148y75af9399m1fbff6d46948bfdf@mail.gmail.com>
	<1292598113.20070823112830@vanille-media.de>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: dbus-glib-native: install dbus-binding-tool to ${STAGING_BINDIR}?
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
X-List-Received-Date: Thu, 23 Aug 2007 11:24:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 8/23/07, Dr. Michael Lauer <mickey@vanille-media.de> wrote:
> pHilipp Zabel wrote:
> > Hi, I've got this change in my local workdir, unfortunately I don't
> > remember what exactly needed the binding tool. Is this ok to commit?
>
> Does anything speak against using autotools_stage_all here?
> I'd rather go away from handcoded do_stage() as much as possible.

Not that I know of - let's try.

cheers
Philipp


