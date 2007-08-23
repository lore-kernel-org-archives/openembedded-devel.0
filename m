Received: from [64.233.184.225] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1IOJLh-000648-CE
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Aug 2007 22:32:13 +0200
Received: by wr-out-0506.google.com with SMTP id c46so470118wra
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2007 13:31:00 -0700 (PDT)
Received: by 10.90.80.8 with SMTP id d8mr2479676agb.1187901059723;
	Thu, 23 Aug 2007 13:30:59 -0700 (PDT)
Received: by 10.90.50.8 with HTTP; Thu, 23 Aug 2007 13:30:59 -0700 (PDT)
Message-ID: <c384c5ea0708231330i33cd810bw945240f8a2f24e10@mail.gmail.com>
Date: Thu, 23 Aug 2007 22:30:59 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org, philipp.zabel@gmail.com
In-Reply-To: <c384c5ea0708231322l708a9a5cv36b4958a233f6eea@mail.gmail.com>
MIME-Version: 1.0
References: <74d0deb30708230151h6601b1c3r9011b2a8d8eea2e8@mail.gmail.com>
	<c384c5ea0708231322l708a9a5cv36b4958a233f6eea@mail.gmail.com>
Subject: Re: glibc-package.bbclass: [ -f ] doesn't take multiple arguments
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
X-List-Received-Date: Thu, 23 Aug 2007 20:32:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> I understand the condition fix, but are you sure the cp action should
> not have a wildcard??
>
My bad, didn't read the second patch chunk. Looks good.

Regards,
-- 
Leon


