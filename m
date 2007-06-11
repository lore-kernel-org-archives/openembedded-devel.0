Received: from [64.233.162.229] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <cliff.brake@gmail.com>) id 1HxqCU-0005PR-Fc
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jun 2007 22:09:18 +0200
Received: by nz-out-0506.google.com with SMTP id n29so1210199nzf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2007 13:06:26 -0700 (PDT)
Received: by 10.114.157.1 with SMTP id f1mr5903110wae.1181592385598;
	Mon, 11 Jun 2007 13:06:25 -0700 (PDT)
Received: by 10.114.185.15 with HTTP; Mon, 11 Jun 2007 13:06:25 -0700 (PDT)
Message-ID: <f96d234e0706111306o57e72d0bs4bda73c2e20018b5@mail.gmail.com>
Date: Mon, 11 Jun 2007 16:06:25 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <6.2.3.4.2.20070608115117.0ba979e8@pop-server.ca.rr.com>
MIME-Version: 1.0
References: <eed7f0160706040138y6a777b6ay86b8237c3462373c@mail.gmail.com>
	<6.2.3.4.2.20070608115117.0ba979e8@pop-server.ca.rr.com>
Subject: Re: Gumstix machine support
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
X-List-Received-Date: Mon, 11 Jun 2007 20:09:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 6/8/07, Glenn Neufeld <gneuf@ca.rr.com> wrote:

>          There's also a problem when building images in that the
> "mkimage" command doesn't get installed, so I've been putting it
> elsewhere and adding it to my PATH.

I think U-boot build installs mkimage into the staging directory, so
this issue should go away when you get your U-boot builds working.

-- 
=======================
Cliff Brake
http://bec-systems.com


