Received: from [64.233.178.248] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JfLPY-0004zC-SL
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Mar 2008 21:42:53 +0100
Received: by hs-out-0708.google.com with SMTP id 23so419192hsn.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2008 13:42:50 -0700 (PDT)
Received: by 10.100.225.19 with SMTP id x19mr7849934ang.5.1206736969864;
	Fri, 28 Mar 2008 13:42:49 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Fri, 28 Mar 2008 13:42:49 -0700 (PDT)
Message-ID: <c384c5ea0803281342j3f836b8cibbf1b9030a5d2859@mail.gmail.com>
Date: Fri, 28 Mar 2008 21:42:49 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: angstrom-distro-devel@linuxtogo.org, 
	openembedded-devel@lists.openembedded.org
In-Reply-To: <fsjbi5$hak$1@ger.gmane.org>
MIME-Version: 1.0
References: <022890FE-5E72-489F-B64C-03593101E508@student.utwente.nl>
	<47E83808.5060501@balister.org>
	<c384c5ea0803271304i4739ea3bpee3ace5854384f4c@mail.gmail.com>
	<fsgvoq$545$1@ger.gmane.org>
	<c384c5ea0803271622i59f5e3bai2a9606e749a0611b@mail.gmail.com>
	<fsjbi5$hak$1@ger.gmane.org>
Subject: Re: [Angstrom-devel] [RFC] Changing stable branch commit policy
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
X-List-Received-Date: Fri, 28 Mar 2008 20:42:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

> Do you want to write a short blurb on this we can stick on the oe and angstrom websites? regards, Koen

Sure, a first shot at that (and sorry for cross-posting, but this
really is OE related :-)

---
The OpenEmbedded project has started to maintain a stable branch, next
to its development branch, on March 28th 2007. Besides
"org.openembedded.dev" there now is the "org.openembedded.stable"
branch.

The plumbing work on the development branch (long-term improvements
such as packaged staging, creating stand-alone SDK toolchains and a
new package manager) colides with the goal of offering a stable base
for OpenEmbedded-derived distributions. Some projects, most notably
the Angstrom distribution, already maintained a stable branch for this
reason.

The effort of maintaining a stable branch is now centralized back into
the OpenEmbedded project. The main goal of the stable branch is to
provide a branch that progresses in time with a minimum of disruptive
changes, especially to the framework, which include classes,
configuration namespace, package management, and tooling such as the
bitbake tool. Changes to the stable branch are selected and reviewed
according to an agreed upon policy before being committed to the
stable branch. This will require extra effort from the OpenEmbedded
developer community.

The stable branch is not intended to keep up with the pace of
development on the development branch. Planned is to create new stable
branches every year; the next stable branch is scheduled to branch of
the development tree during 2008.12. Old stable branches will go in
unmaintained mode 3 months after a new stable branch is created; the
current stable will retire 2009.2.

OpenEmbedded projects and distributions now have the choice of at
least a .dev and .stable branch and the OpenEmbedded developers can
keep on plumbing.
---


Leon.


