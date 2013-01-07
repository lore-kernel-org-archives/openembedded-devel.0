Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsAHI-000490-0t
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jan 2013 11:50:00 +0100
Received: from mail-gg0-f197.google.com ([209.85.161.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 07 Jan 2013 02:34:49 -0800
Received: by mail-gg0-f197.google.com with SMTP id i1so29317180ggn.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jan 2013 02:34:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=pyOl58K3xZ/twnoLKV2C+6L3T1N6lIHn6ZQ/IBeeqeg=;
	b=IgKV2AIAeKephbPMJ8DSDZPFno8ESM3igQIu7WkqSx8tkpyEkHKshl2eS2KEQTpO+O
	gnVUpiLApZ7Ib2OOaxyupndWHdv5J7dnq5z/gdjTRyTAjl9MQt+uTk2DITd77OEWVnDS
	93564tP/nu4dKL4KHBfvm54q7hJSUjd6TCcGFOH2/r7woOspeFEgwUp+/xfsBU2Fgud/
	HpUj1RsJd1gOpCRnlubkOFITlLpPje4BMWsrWe7JB4yPc2yGwrjnc8DqDsUScFmut0cw
	UZm4AVDXZryZ+uWEcqcWFl8kbNrepJ2aXg2XmX6k+4IiJr19M0j2gr7pDoTXXIBLt6/V
	pMnw==
X-Received: by 10.220.247.136 with SMTP id mc8mr4169151vcb.44.1357554888818;
	Mon, 07 Jan 2013 02:34:48 -0800 (PST)
Received: by 10.220.247.136 with SMTP id mc8mr4169146vcb.44.1357554888743;
	Mon, 07 Jan 2013 02:34:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Mon, 7 Jan 2013 02:34:28 -0800 (PST)
In-Reply-To: <1357550432-9072-1-git-send-email-constantinx.musca@intel.com>
References: <1357550432-9072-1-git-send-email-constantinx.musca@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Jan 2013 10:34:28 +0000
Message-ID: <CAJTo0LZRPidifkOfXo6PB4ywRbjUg=ze8VEwj9Tjyi29fOnfcQ@mail.gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
X-Gm-Message-State: ALoCoQm1GVWbMvSxnI+Oi4AhL8An5OyG6dANqIn5u7MI5HpGHJgggkXHTohLg51Mus5B89GE1ltBaLuCDAwCvk8o1odpRdYBelYZQHBWnOSLwABMwPVSY8GdZEobJYo8dt07cxF7P9D17abxA/+s6TK4P30MSfL1O9BQ+D3DHA1EkwByWdts1u+SuHV4dT23/97AFc0Dn1s6
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libgdata: remove recipe
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
X-List-Received-Date: Mon, 07 Jan 2013 10:50:00 -0000
Content-Type: text/plain; charset=UTF-8

On 7 January 2013 09:20, Constantin Musca <constantinx.musca@intel.com> wrote:
> Part of the sato trimming process
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>

Context: nothing in oe-core uses this anymore.  This should be moved
to meta-oe (meta-gnome, I expect) to stop that breaking.

Ross


