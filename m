Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SKVOG-00028B-QV
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 15:57:48 +0200
Received: by yhjj56 with SMTP id j56so3688383yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2012 06:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=4gY5I/2Zh2k8K/FjcXIi9dSx2OpUM+z+r/F4PKlErHU=;
	b=YV56jKZdS5fZoBlugrXGUllfVaA2p4uRo7H6w/A7Ww3NEPTT9nYHoGfda6ZKt3U3Gz
	iKGlnOYfpaQNxwHKvRmj3mQercg8A1VTZgbC6k8rvlkwn2nJDtO3TEqx49UDPVhYm6vE
	WsFlJlktjEFnpNWwNBVizC7O5p4dPwkZwz8etEOhHRUrPipKuyNvWqp0opUpD4mJcNDR
	svUclMxgBP8fVaD4gKZYxYrxyfLEu4X2GAj1rGBiiElukPreNyhm5TvH1bansvlEKCQO
	rRJ7iZf2gmOVVSHjvhr0Hjtq4/DPyLlzhY06yECohLyddvMRYKP37iCeyHuYGWlv0/b5
	yw+A==
MIME-Version: 1.0
Received: by 10.50.163.71 with SMTP id yg7mr1999191igb.32.1334756900866; Wed,
	18 Apr 2012 06:48:20 -0700 (PDT)
Received: by 10.231.67.134 with HTTP; Wed, 18 Apr 2012 06:48:20 -0700 (PDT)
Date: Wed, 18 Apr 2012 15:48:20 +0200
Message-ID: <CAOHjBZu=T6TrSomYSOW+Sp5afFwHTu5f4zGKx-3T361gdrJdmg@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [oe-core] build for 32bit architecture
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
X-List-Received-Date: Wed, 18 Apr 2012 13:57:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I need to build the native packages for a 32bit architecture, although I'm
working on a 64bit machine.
So I need to pass the -m32 option to the compiler and my question is about
the right place where to put it
to be inherited by all native packages.

Please let me know, best regards.
Giuseppe

