Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (unknown [209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8BCB665F62
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 May 2014 15:15:05 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id l6so2975676qcy.23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 May 2014 08:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=Ay51WwAn38//YeMMCZjXlGoA7RJSrRmw85ORyupltCo=;
	b=a/fJRTkFSzRueFpP79Sr7Jc72a+qcelXhd3ZlZxPbZzyxo9eRLfo63RN2yq88ErSVG
	6DBnLM8bX+6yiQaon4cbDCR75TpnfTdkknDmsGAFddwZX0TqYkzuDXqY9mjGehJ8UvDw
	hcPz5ABb021s2/meG4xrfgUB+7LKuwD1wfkoZFiJ47yBITSvmVH2NwD8jDyu9YrXMqBH
	XBZzPYd6OetQgBuDbqs8hOJLJZXCPtU+BAjIRxZV8ZZbpAw56E8RfaaMAq39Ea4+6kpE
	tOrq3D8iEwB1LRJvv4DvqG1EQ2DVmRAN35czD58P4V75KhbF0w3wD59yioOhDOaVedFw
	LhkQ==
X-Gm-Message-State: ALoCoQlqqiWNKxGVKFlqrz588UnmRiuW2BQUIvS/Cq3T9UYULQWCrt5jvQPAiwmEnwCiWTD3jbYz
X-Received: by 10.224.115.68 with SMTP id h4mr5443612qaq.35.1399560540785;
	Thu, 08 May 2014 07:49:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Thu, 8 May 2014 07:48:40 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 May 2014 15:48:40 +0100
Message-ID: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: GStreamer 0.10's future
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
X-List-Received-Date: Thu, 08 May 2014 15:15:06 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

Sorry for the cross-post but I want this to have a wide audience.

For the 1.7 release I want to move GStreamer 0.10 from oe-core into
meta-multimedia, and ensure everything in oe-core has ported to
GStreamer 1.x.  GStreamer 0.10 is considered dead upstream and is
unmaintained so we don't need to be shipping both versions anymore.

Everyone in agreement?  Should I expect any hate mail over this?

Ross

