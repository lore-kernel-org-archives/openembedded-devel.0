Return-Path: <californialsullivan@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 386406017E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 21:26:51 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id a141so1318329oig.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 14:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=oc0yrdIDLk8BFH9/DZDf803Mcb9IOpQsYYRh1/94VnE=;
	b=qnuVe0/daKEjIsACXX8GZaqwwcELsdjR0vmjA/1MT+ZQFmBbHvsQ8QM/bPVZdSWnVl
	ovYaUfvLpyg/weHHcDjQIuKubu5W0qcXYw9XcYkewTVqxRDMieTvBTeChCfxIKGje75w
	LfBWgfBEF7zmH0qzRDzFcCxLjgsVfk1kmRmeVNn7CRFHnh8yMtYMO6bAUMBqiOa1q/9+
	wxf2pv5Bn8W3sRj4qbl6AE6U7gegIcE7oPI/m/np46P8bIkmw5LpdSv88wx5CAjNdUDJ
	bvQM5sELwQtj5zbJuPyztcmakFqLvDFgeewZT2BNI3f7pp3id9NxDTkDENaW42H8BGZ6
	MZZQ==
MIME-Version: 1.0
X-Received: by 10.182.79.37 with SMTP id g5mr51666541obx.41.1412112412824;
	Tue, 30 Sep 2014 14:26:52 -0700 (PDT)
Received: by 10.76.157.229 with HTTP; Tue, 30 Sep 2014 14:26:52 -0700 (PDT)
Date: Tue, 30 Sep 2014 14:26:52 -0700
Message-ID: <CAMP9K8-g9Cd6SiNOidENMtvZ8beeWWAvv0GHA=7j-N_LUk_XJg@mail.gmail.com>
From: California Sullivan <californialsullivan@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: meta-xfce: how to change the default background?
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
X-List-Received-Date: Tue, 30 Sep 2014 21:26:59 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

When building an image and using the xfce package, I would like to be able
to set a custom default background (i.e., before the image is ever booted
up).

I have been unable to find any documentation on how to do this, and I
haven't found any clues by poking around in the layer.

Any pointers from somebody with experience in this area, or any links to
documentation on how this could be done would be very much appreciated.

Thank you,
Cal Sullivan

