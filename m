Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id AA6A26D1F4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2013 01:16:35 +0000 (UTC)
Received: (qmail 23657 invoked by uid 1003); 21 Oct 2013 01:16:37 -0000
Received: from unknown (HELO ?192.168.1.103?) (philip@opensdr.com@108.44.88.68)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	21 Oct 2013 01:16:36 -0000
Message-ID: <52648074.8000003@balister.org>
Date: Sun, 20 Oct 2013 21:16:36 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <2478778.XBk41EpSZr@koontz>
In-Reply-To: <2478778.XBk41EpSZr@koontz>
X-Enigmail-Version: 1.5.2
Subject: Re: Regarding layers and their versioning.
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
X-List-Received-Date: Mon, 21 Oct 2013 01:16:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 10/20/2013 05:20 PM, Søren Holm wrote:
> Hello
> 
> What is the best way to manage a private repo with recipes as well as meta-oe, 
> meta-core and meta-angstrom.
> 
> Currently I have a private repo that has the layers attached as submodules. Is 
> that a crazy setup or what? ...... and while  I'm at it - which revision of 
> all those layers are ment to match together? does master og meta-oe match 
> master of meta-core or do they have simmilar tags/branches.
> 
> Thanks in advance.
> 

If it works well for you, it must be a good idea. I've also heard of
people using repo.

Philip

