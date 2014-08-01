Return-Path: <Yao.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 74CE365C70
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 16:05:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s71G5lh8029496
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Aug 2014 09:05:47 -0700 (PDT)
Received: from [128.224.140.163] (128.224.140.163) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Fri, 1 Aug 2014 09:05:46 -0700
Message-ID: <53DBBAC4.8040403@windriver.com>
Date: Fri, 1 Aug 2014 12:05:24 -0400
From: Yao Zhao <yao.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <20140801133505.GA702@windriver.com>
	<1406903795-9767-1-git-send-email-yao.zhao@windriver.com>
In-Reply-To: <1406903795-9767-1-git-send-email-yao.zhao@windriver.com>
X-Originating-IP: [128.224.140.163]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH v2] add support for opendataplane
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
X-List-Received-Date: Fri, 01 Aug 2014 16:05:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Please hold on reviewing this.
I think it needs more work and will repost it a bit later.

Sorry about that.

thanks,
yao

------------------------------------------------------------------------

*From:* Zhao, Yao
*Sent:* Friday, August 01, 2014 10:36AM
*To:* openembedded-devel@lists.openembedded.org
*Subject:* [oe] [meta-networking][PATCH v2] add support for opendataplane

changes v2:
1.change /usr to variable in 0.2 bb
2.replace AUTOREV with current HEAD tag(which works)
3.add more descriptions for dpdk build in commit message
4.will send the 0001-linux-dpdk-remove-unnecessary-include-path.patch
   to upstream.

Yao Zhao (1):
   add support for opendataplane

  ...inux-dpdk-remove-unnecessary-include-path.patch | 29 ++++++++++++++++++++++
  .../opendataplane/opendataplane.inc                | 21 ++++++++++++++++
  .../opendataplane/opendataplane_0.2.bb             | 25 +++++++++++++++++++
  .../opendataplane/opendataplane_git.bb             | 14 +++++++++++
  4 files changed, 89 insertions(+)
  create mode 100644 meta-networking/recipes-support/opendataplane/files/0001-linux-dpdk-remove-unnecessary-include-path.patch
  create mode 100644 meta-networking/recipes-support/opendataplane/opendataplane.inc
  create mode 100644 meta-networking/recipes-support/opendataplane/opendataplane_0.2.bb
  create mode 100644 meta-networking/recipes-support/opendataplane/opendataplane_git.bb




