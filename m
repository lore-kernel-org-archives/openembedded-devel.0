Received: from [64.233.162.231] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <leon.woestenberg@gmail.com>) id 1GsoLu-0000ba-SK
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Dec 2006 23:37:59 +0100
Received: by nz-out-0102.google.com with SMTP id m22so565907nzf
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Dec 2006 14:36:45 -0800 (PST)
Received: by 10.65.219.13 with SMTP id w13mr6669712qbq.1165617403637;
	Fri, 08 Dec 2006 14:36:43 -0800 (PST)
Received: by 10.65.230.8 with HTTP; Fri, 8 Dec 2006 14:36:43 -0800 (PST)
Message-ID: <c384c5ea0612081436t19b3179dj2218d1ef3586af61@mail.gmail.com>
Date: Fri, 8 Dec 2006 23:36:43 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1896374565.20061208004517@vanille-media.de>
MIME-Version: 1.0
References: <HOECLKEKOHLAMMGDLLBHEEFLJAAA.skoroneos@digital-opsis.com>
	<HOECLKEKOHLAMMGDLLBHCEFKJCAA.skoroneos@digital-opsis.com>
	<c384c5ea0612070902o7dbb71e8v63cd137b5b611815@mail.gmail.com>
	<1825230355.20061207183653@vanille-media.de>
	<c384c5ea0612071104q1cd27beckd9bddfbb112c1d9d@mail.gmail.com>
	<1165532018.5601.98.camel@localhost.localdomain>
	<1896374565.20061208004517@vanille-media.de>
Subject: Re: FOSDEM'07
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
X-List-Received-Date: Fri, 08 Dec 2006 22:38:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Michael,

On 12/8/06, Michael 'Mickey' Lauer <mickey@vanille-media.de> wrote:
>
> <poster tips>
>
Any ideas on the size of the target poster (A3, A2-A0?), and the font
size in points or cm?

Which concepts would we want to explain on the poster?

We should first summarize that I think. A graphic artist cannot make a
graphic without knowing what should be shown.

I'm quite noob there, but here's what I understand so far:


BitBake/OpenEmbedded is a set of tools and metadata to easily build
ready-to-deploy kernels, software packages or complete filesystem
images. It relieves the developer from much of the subtleties of cross
compilation and dependencies.

A bitbake recipe describes all tasks to be performed for a package,
and in which order.

A bitbake class implements tasks, can inherit tasks from other classes.

BitBake itself is the task executor, taking care of build-time and
run-time dependencies.

Tasks can be overridden and new tasks can be added.

A default chain of tasks consists of fetch, unpack, patch, configure,
compile, install, package, stage.

OpenEmbedded is a coherent set of classes, many package recipes, and
configurations for targets and distributions. Together with the
BitBake tool this allows you to build kernels and filesystem images
for your targets in an easy way.


Regards,

Leon.


