Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ve0-f176.google.com (mail-ve0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7B7BB620B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 18:12:39 +0000 (UTC)
Received: by mail-ve0-f176.google.com with SMTP id cz12so2733909veb.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 11:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=q1ngj05UPw5aIBpfgDYui8V5NQ19ICF9sf2U211Nfns=;
	b=gHGkwuK5BLms0wpooDUPS04ZKppUSPDqtJMkvx+aUqxUn6dPHjD3xnTvhE6tFbvJTB
	g4ApFDsFWO+2G3Vi5Hy9EBTADvdO4NzltqIshPGXpiwBeBgDLkPo0hDy5otvjVv4yiWm
	cA6jmXgF6iokb4WPLdMok2lLqG5ZI+UDLL+gQqVAot/JiK9AVMrAs7EEcSibKXM2yj1E
	zNYvU9LlRzLFsT3brteSeIyir8RcZdwcT/1Hfe1F/2y1pPuMBNtXd5h8oAtikWAJZo7u
	YWGU1mbIHsfAqA4zq0Io9gxwM76GVSYwSVxTaDwKg7vID6HQT71iUKAa/1MzyI+uZ6xV
	Tdjw==
MIME-Version: 1.0
X-Received: by 10.221.3.195 with SMTP id nz3mr979858vcb.35.1395857548378; Wed,
	26 Mar 2014 11:12:28 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Wed, 26 Mar 2014 11:12:28 -0700 (PDT)
Date: Wed, 26 Mar 2014 11:12:28 -0700
Message-ID: <CAFeBWL73bvbfgZdNxHJshfLcGrQ647diP24Oy-vHjkCFX6XG+w@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Warnings during build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Mar 2014 18:12:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hope I am not spamming the list with pesky questions.
I am getting build warnings similar to below:

WARNING: gtk-immodule-ipa-2.24.22 was registered as shlib provider for
im-ipa.so, changing it to gtk3-immodule-ipa-3.10.7 because it was built
later


The full list of warnings can be found at - http://pastebin.com/quqwCPEq.

I am not sure what these warnings are. They are definitely new in 1.6. I am
trying to figure out if there is something I can do, or if this will be
sorted out as we get closer to the 1.6 release date.

Adam

