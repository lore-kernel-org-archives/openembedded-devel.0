Received: from [209.85.128.191] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1IlPYn-0006ad-42
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2007 15:49:13 +0200
Received: by fk-out-0910.google.com with SMTP id 18so846606fks
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2007 06:41:45 -0700 (PDT)
Received: by 10.82.172.10 with SMTP id u10mr5858677bue.1193402771470;
	Fri, 26 Oct 2007 05:46:11 -0700 (PDT)
Received: by 10.82.118.8 with HTTP; Fri, 26 Oct 2007 05:46:11 -0700 (PDT)
Message-ID: <74d0deb30710260546h197f1dfemdf93bcc00d2643f6@mail.gmail.com>
Date: Fri, 26 Oct 2007 14:46:11 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4721C41E.3070109@hni.uni-paderborn.de>
MIME-Version: 1.0
References: <4721C41E.3070109@hni.uni-paderborn.de>
Subject: Re: How commit bugfix
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
X-List-Received-Date: Fri, 26 Oct 2007 13:49:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/26/07, Stefan Herbrechtsmeier <hbmeier@hni.uni-paderborn.de> wrote:
> Hi,
>
> What is the best way do commit a bugfix?
>
> Is it ok, to open a new bug and set it to fixed with the solution of the
> problem?

You should open a new bug and apply the patch, but leave the bug as NEW.
Then hopefully somebody with commit access will quickly test the patch and
commit it to the repository, and set the bug to FIXED afterwards.

regards
Philipp


